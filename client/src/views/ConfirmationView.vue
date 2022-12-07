<template>
  <div v-if="!orderDetailsStore.hasOrderDetails()">
    <p class="no-confirmation-text">
      We are sorry, the order you requested could not be found.
    </p>
    <router-link
      :to="{
        name: 'home-view',
      }"
    >
      <button class="continue-shop-buttons">Back to Home Page</button>
    </router-link>
  </div>

  <div v-else class="confirmation-view">
    <ul>
      <li class="large-text">
        <b>Thank you for your order!</b>
      </li>
      <li>
        Confirmation Number:&nbsp;&nbsp;
        <b>{{ orderDetails.order.confirmationNumber }}</b>
      </li>
      <li>
        Order Time:&nbsp;&nbsp;<b>{{ orderDate }}</b>
      </li>
    </ul>
    <div class="purchase-summary"><b>Purchase Summary</b></div>
    <confirmation-table></confirmation-table>
    <section>
      <div class="purchase">
        <p>Subtotal:</p>
        <p>Surcharge:</p>
        <p>Total:</p>
      </div>
      <div class="purchase-info">
        <p>
          <b>{{
            asDollarsAndCents(
              orderDetails.order.amount - cartStore.cart.surcharge
            )
          }}</b>
        </p>
        <p>
          <b>{{ asDollarsAndCents(cartStore.cart.surcharge) }}</b>
        </p>
        <p>
          <b>{{ asDollarsAndCents(orderDetails.order.amount) }}</b>
        </p>
      </div>
    </section>
    <p class="customer-information"><b>Customer Information</b></p>
    <section>
      <div class="customer">
        <p>Name:</p>
        <p>Address:</p>
        <p>Email:</p>
        <p>Phone:</p>
        <p>Paycard:</p>
      </div>
      <div class="customer-info">
        <p>
          <b>{{ orderDetails.customer.customerName }}</b>
        </p>
        <p>
          <b>{{ orderDetails.customer.address }}</b>
        </p>
        <p>
          <b>{{ orderDetails.customer.email }}</b>
        </p>
        <p>
          <b>{{ orderDetails.customer.phone }}</b>
        </p>
        <p>
          <b>{{ hideCCNumber }}({{ ccExpMonth }} - {{ ccExpYear }})</b>
        </p>
      </div>
    </section>
  </div>
</template>

<script setup>
import { asDollarsAndCents } from "@/utils";
import ConfirmationTable from "@/components/ConfirmationTable";
import { useCartStore } from "@/stores/CartStore";
const cartStore = useCartStore();

import { useOrderDetailsStore } from "@/stores/OrderDetailsStore";
import { computed } from "vue";
const orderDetailsStore = useOrderDetailsStore();
const orderDetails = orderDetailsStore.orderDetails;
const formatDisplayDate = function (displayDate) {
  const date = new Date(displayDate);
  const dateTime = date.toUTCString().split("GMT")[0];
  return dateTime;
};
const orderDate = computed(function () {
  let epoch = orderDetails.order.dateCreated;
  let orderDate = new Date(epoch);
  let orderdate = formatDisplayDate(orderDate);
  return orderdate;
});
const hideCCNumber = computed(function () {
  let number = orderDetails.customer.ccNumber;
  let newNumber = "**** **** ****" + number.substr(number.length - 4, 4);
  return newNumber;
});
const ccExpYear = computed(function () {
  let epoch = orderDetails.customer.ccExpDate;
  let newDate = new Date(epoch);
  let year = newDate.getUTCFullYear();
  return year;
});
const ccExpMonth = computed(function () {
  let epoch = orderDetails.customer.ccExpDate;
  let newDate = new Date(epoch);
  let month = newDate.getMonth() + 1;
  return month;
});
</script>

<style scoped>
.no-confirmation-text {
  text-align: center;
  padding-top: 30px;
  color: var(--primary-color);
  font-size: 28px;
  justify-content: center;
}

.confirmation-view {
  display: flex;
  flex-direction: column;
  color: var(--card-text-color);
}

ul {
  text-align: center;
}
ul > li {
  text-align: center;
  margin: 0.3em;
  font-size: 22px;
}
.large-text {
  color: var(--primary-color);
  padding-top: 30px;
  padding-bottom: 10px;
  font-size: 30px;
}
.purchase-summary {
  color: var(--primary-color);
  text-align: center;
  font-size: x-large;
  margin-top: 1em;
}
.purchase {
  display: inline-block;
  position: relative;
  top: 50%;
  left: 50%;
  margin-left: -100px;
}

.purchase-info {
  display: inline-block;
  position: relative;
  top: 50%;
  left: 50%;
  margin-left: 20px;
}

.customer-information {
  color: var(--primary-color);
  text-align: center;
  font-size: x-large;
  padding-top: 30px;
}
.customer {
  padding-top: 20px;
  margin-bottom: 50px;
  display: inline-block;
  position: relative;
  top: 50%;
  left: 50%;
  margin-left: -160px;
}
.customer-info {
  display: inline-block;
  position: relative;
  top: 50%;
  left: 50%;
  margin-left: 20px;
}
p {
  font-size: 23px;
}
.continue-shop-buttons {
  margin-bottom: 2em;
  font-size: 23px;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 2px none;
  border-radius: 10px;
  background: var(--primary-color);
  color: white;
  margin-top: 40px;
  position: relative;
  top: 50%;
  left: 50%;
  margin-left: -130px;
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
</style>
