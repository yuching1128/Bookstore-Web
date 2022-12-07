<script setup lang="ts">
import { reactive } from "vue";
import useVuelidate from "@vuelidate/core";
import {
  email,
  helpers,
  maxLength,
  minLength,
  required,
} from "@vuelidate/validators";
import { useCartStore } from "@/stores/CartStore";
const cartStore = useCartStore();
const cart = cartStore.cart;
import { isCreditCard, isMobilePhone } from "@/utils";
import CheckoutFieldError from "@/components/CheckoutFieldError.vue";
import { useCategoryStore } from "@/stores/CategoryStore";
import { asDollarsAndCents } from "@/utils";
const categoryStore = useCategoryStore();
import router from "@/router";

const months: string[] = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

const form = reactive({
  name: "",
  address: "",
  phone: "",
  email: "",
  ccNumber: "",
  ccExpiryMonth: new Date().getMonth() + 1,
  ccExpiryYear: new Date().getFullYear(),
  checkoutStatus: "",
});

const rules = {
  name: {
    required: helpers.withMessage("Please provide a name.", required),
    minLength: helpers.withMessage(
      "Name must have at least 4 letters.",
      minLength(4)
    ),
    maxLength: helpers.withMessage(
      "Name can have at most 45 letters.",
      maxLength(45)
    ),
  },
  address: {
    required: helpers.withMessage("Please provide an address.", required),
    minLength: helpers.withMessage(
      "Your address must have at least 4 letters.",
      minLength(4)
    ),
    maxLength: helpers.withMessage(
      "Your address  can have at most 45 letters.",
      maxLength(45)
    ),
  },
  phone: {
    required: helpers.withMessage("Please provide a phone number.", required),
    phone: helpers.withMessage(
      "Please provide a valid phone number.",
      (value: string) => !helpers.req(value) || isMobilePhone(value)
    ),
  },
  email: {
    required: helpers.withMessage("Please provide an email address.", required),
    email: helpers.withMessage("Please provide a valid email address.", email),
  },
  ccNumber: {
    required: helpers.withMessage("Please provide a credit card.", required),
    ccNumber: helpers.withMessage(
      "Please provide a valid credit card.",
      (value: string) => !helpers.req(value) || isCreditCard(value)
    ),
  },
  ccExpiryMonth: {},
  ccExpiryYear: {},
};
const $v = useVuelidate(rules, form);

async function submitOrder() {
  console.log("Submit order");
  const isFormCorrect = await $v.value.$validate();
  if (!isFormCorrect) {
    form.checkoutStatus = "ERROR";
  } else {
    form.checkoutStatus = "PENDING";
    await cartStore
      .placeOrder({
        name: form.name,
        address: form.address,
        phone: form.phone,
        email: form.email,
        ccNumber: form.ccNumber,
        ccExpiryMonth: form.ccExpiryMonth,
        ccExpiryYear: form.ccExpiryYear,
      })
      .then(() => {
        form.checkoutStatus = "OK";
        cartStore.clearCart();
        router.push({ name: "confirmation-view" });
      })
      .catch((reason) => {
        form.checkoutStatus = "SERVER_ERROR";
        console.log("Error placing order", reason);
      });
  }
}

/* NOTE: For example yearFrom(0) == <current_year> */
function yearFrom(index: number) {
  return new Date().getFullYear() + index;
}
</script>

<style scoped>
.checkout-page {
  background: var(--card-background-color);
  color: var(--primary-color);
}

.checkout-empty {
  padding: 3em;
  text-align: center;
  font-size: 30px;
}

.checkout-page-body {
  display: flex;
  justify-content: center;
  padding-top: 2em;
  padding-button: 2em;
  font-size: 25px;
}

/* form */
form {
  display: flex;
  flex-direction: column;
}

form > div {
  padding-right: 100px;
  display: flex;
  justify-content: flex-end;
  margin-bottom: 20px;
}

form > div > input,
form > div > select {
  background-color: #f1f1f1;
  border-radius: 8px;
  margin-left: 16px;
  border: 3px solid var(--primary-color-dark);
}

label {
  padding-top: 8px;
}

input {
  line-height: 30px;
  padding: 4px;
}

option {
  line-height: 30px;
}

.exp-date-month * {
  text-align: center;
  background-color: #f1f1f1;
}

.exp-date-year * {
  text-align: center;
  background-color: #f1f1f1;
}

/* button */
.continue-shop-buttons {
  margin-bottom: 2em;
  font-size: 23px;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 2px none;
  border-radius: 10px;
  background: #aa7d53;
  color: white;
  margin-top: 40px;
}

.continue-shop-buttons:visited {
  display: inline-block;
  background: #aa7d53;
  color: white;
  text-decoration: none;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 2px none;
  border-radius: 10px;
}

.continue-shop-buttons:hover {
  background: #845937;
  color: white;
}

.continue-shop-buttons:active {
  background: var(--primary-color-dark);
  color: white;
}

.checkout-button {
  font-size: 26px;
  margin-right: 15px;
  margin-top: 40px;
  padding: 12px;
}

/* form text */
.form-text-holder {
  color: #ef5f25;
  font-size: 24px;
  font-weight: bold;
  padding: 10px;
  text-align: center;
  text-decoration: underline;
}

.form-pending-text {
  padding-right: 180px;
}

.form-ok-text {
  padding-right: 180px;
}

/* purchase info */
ul,
li {
  text-align: end;
  margin-top: 0.5em;
}

.purchase-info-box {
  display: flex;
  flex-direction: column;
  align-content: flex-end;
}

.total-charge-box {
  padding-top: 1em;
  text-align: end;
}

.purchase-info-box-info {
  padding-top: 30px;
}

.row {
  background-color: var(--primary-color);
  height: 4px;
  width: 50%;
  margin-left: 300px;
  align-content: flex-end;
}
</style>

<template>
  <div class="checkout-page">
    <section class="checkout-empty" v-if="cart.empty">
      <p>Your cart is empty.</p>
      <p>Please add an item to your cart to checkout.</p>
      <router-link
        :to="{
          name: 'category-view',
          params: {
            name: categoryStore.categoryName,
          },
        }"
      >
        <button class="continue-shop-buttons">
          <font-awesome-icon icon="fa-solid fa-circle-arrow-left" />
          Continue Shopping
        </button>
      </router-link>
    </section>

    <section class="checkout-page-body" v-if="!cart.empty">
      <form @submit.prevent="submitOrder">
        <div>
          <label for="name">Name</label>
          <input
            type="text"
            size="20"
            id="name"
            name="name"
            v-model.lazy="$v.name.$model"
          />
        </div>
        <CheckoutFieldError field-name="name" :validator="$v" />
        <div>
          <label for="address">Address</label>
          <input
            type="text"
            size="20"
            maxlength="45"
            id="address"
            name="address"
            v-model.lazy="$v.address.$model"
          />
        </div>
        <CheckoutFieldError field-name="address" :validator="$v" />
        <div>
          <label for="phone">Phone</label>
          <input
            type="text"
            size="20"
            id="phone"
            name="phone"
            v-model.lazy="$v.phone.$model"
          />
        </div>
        <CheckoutFieldError field-name="phone" :validator="$v" />
        <div>
          <label for="email">Email</label>
          <input
            type="text"
            size="20"
            maxlength="45"
            id="email"
            name="email"
            v-model.lazy="$v.email.$model"
          />
        </div>
        <CheckoutFieldError field-name="email" :validator="$v" />
        <div>
          <label for="ccNumber">Credit card</label>
          <input
            type="text"
            size="20"
            maxlength="45"
            id="ccNumber"
            name="ccNumber"
            v-model="$v.ccNumber.$model"
          />
        </div>
        <CheckoutFieldError field-name="ccNumber" :validator="$v" />
        <div>
          <label>Exp Date</label>
          <select
            v-model="$v.ccExpiryMonth.$model"
            class="exp-date-month"
            style="width: 210px; height: 42px"
          >
            <option
              v-for="(month, index) in months"
              :key="index"
              :value="index + 1"
            >
              {{ month }} ({{ index + 1 }})
            </option>
          </select>
          <select
            v-model="$v.ccExpiryYear.$model"
            class="exp-date-year"
            style="width: 105px; height: 42px"
          >
            <option
              v-for="(year, index) in 15"
              :key="index"
              :value="2020 + index + 1"
            >
              {{ yearFrom(index) }}
            </option>
          </select>
        </div>

        <div>
          <button
            class="button checkout-button"
            @click.prevent="submitOrder"
            type="submit"
          >
            Complete Purchase&nbsp;
            <font-awesome-icon icon="fa-solid fa-money-check-dollar" />
          </button>
        </div>
        <div v-if="form.checkoutStatus !== ''" class="form-text-holder">
          <template v-if="form.checkoutStatus === 'ERROR'">
            <div class="form-error-text" v-if="$v.$invalid">
              <font-awesome-icon icon="fa-solid fa-triangle-exclamation" />
              Please fix the problems above and try again.
            </div>
          </template>

          <template v-if="form.checkoutStatus === 'PENDING'">
            <div class="form-pending-text">Processing...</div>
          </template>
          <template v-if="form.checkoutStatus === 'OK'">
            <div class="form-ok-text">Order placed...</div>
          </template>
          <template v-if="form.checkoutStatus === 'SERVER_ERROR'">
            <div class="form-error-text">
              <font-awesome-icon icon="fa-solid fa-triangle-exclamation" />
              An unexpected error occurred, please try again.
            </div>
          </template>
        </div>
      </form>
      <section class="purchase-info-box">
        <div class="total-charge-box">
          <p>
            Your credit card will be charged
            <b>{{ asDollarsAndCents(cartStore.cart.total) }}</b>
            in total.
          </p>
        </div>
        <div class="purchase-info-box-info">
          <ul>
            <li>
              Subtotal:&nbsp;
              <b>{{ asDollarsAndCents(cartStore.cart.subtotal) }}</b>
            </li>
            <li>
              Surcharge:&nbsp;
              <b>{{ asDollarsAndCents(cartStore.cart.surcharge) }}</b>
            </li>
            <li style="display: flex; flex-direction: row">
              <div class="row"></div>
            </li>
            <li>
              Total:&nbsp;
              <b>{{ asDollarsAndCents(cartStore.cart.total) }}</b>
            </li>
          </ul>
        </div>
      </section>
    </section>
  </div>
</template>
