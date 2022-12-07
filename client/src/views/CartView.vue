<script>
import CartTable from "@/components/CartTable";
export default {
  name: "CartView",
  components: { CartTable },
};
</script>

<script setup>
import { asDollarsAndCents } from "@/utils";
import { useCartStore } from "@/stores/CartStore";
const cartStore = useCartStore();
import { useCategoryStore } from "@/stores/CategoryStore";
const categoryStore = useCategoryStore();
</script>

<template>
  <div>
    <section v-if="cartStore.count === 0">
      <div class="empty-state">Your cart is empty.</div>
      <router-link
        :to="{
          name: 'category-view',
          params: {
            name: categoryStore.categoryName,
          },
        }"
      >
        <button class="continue-shop-button">
          <font-awesome-icon icon="fa-solid fa-circle-arrow-left" />
          &nbsp;Continue Shopping
        </button>
      </router-link>
    </section>
    <section v-else>
      <p class="non-empty-state" v-if="cartStore.count === 1">
        Your cart has 1 book in it.
      </p>
      <p class="non-empty-state" v-else>
        Your cart has {{ cartStore.count }} books in it.
      </p>
      <p class="non-empty-state-amount">
        Your total amount is {{ asDollarsAndCents(cartStore.cart.total) }}.
      </p>
      <cart-table></cart-table>
      <div>
        <router-link
          :to="{
            name: 'category-view',
            params: {
              name: categoryStore.categoryName,
            },
          }"
        >
          <button class="continue-button">
            <font-awesome-icon icon="fa-solid fa-circle-arrow-left" />
            &nbsp;Continue Shopping
          </button>
        </router-link>
        <router-link to="../Checkout">
          <button class="button checkout-button">
            Checkout&nbsp;
            <font-awesome-icon icon="fa-solid fa-circle-arrow-right" />
          </button>
        </router-link>
      </div>
      <div class="clear-cart">
        <button class="clear-button" @click="cartStore.clearCart">
          Clear Cart
        </button>
      </div>
    </section>
  </div>
</template>

<style scoped>
.empty-state {
  padding: 3em;
  text-align: center;
  font-size: 30px;
}

.non-empty-state {
  margin-top: 1.5em;
  text-align: center;
  font-size: 25px;
}

.non-empty-state-amount {
  margin-bottom: 1.5em;
  text-align: center;
  font-size: 25px;
}

.continue-shop-button {
  margin-left: -130px;
  margin-bottom: 3em;
  font-size: 25px;
  position: relative;
  top: 50%;
  left: 50%;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 2px none;
  border-radius: 10px;
  background: #aa7d53;
  color: white;
}

.continue-shop-button:visited {
  display: inline-block;
  background: #aa7d53;
  color: white;
  text-decoration: none;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 2px none;
  border-radius: 10px;
}

.continue-shop-button:hover {
  background: #845937;
  color: white;
}

.continue-shop-button:active {
  background: var(--primary-color-dark);
  color: white;
}

.continue-shop-button {
  font-size: 23px;
}

.continue-button {
  background: #aa7d53;
  color: white;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 2px none;
  border-radius: 10px;
  margin-left: -450px;
  margin-top: 35px;
  display: inline-block;
  text-decoration: none;
  position: relative;
  top: 50%;
  left: 50%;
  font-size: 23px;
}

.continue-button:visited {
  display: inline-block;
  background: #aa7d53;
  color: white;
  text-decoration: none;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 2px none;
  border-radius: 10px;
}

.continue-button:hover {
  background: #845937;
  color: white;
}

.continue-button:active {
  background: var(--primary-color-dark);
  color: white;
}

.checkout-button {
  margin-left: 480px;
  font-size: 23px;
  display: inline-block;
  position: relative;
  top: 50%;
  left: 50%;
}

.clear-cart {
  margin-top: 20px;
  margin-bottom: 30px;
  font-size: 18px;
}

.clear-button {
  margin-left: -450px;
  display: inline-block;
  color: #aa7d53;
  text-decoration: none;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 3px solid #aa7d53;
  border-radius: 10px;
  position: relative;
  top: 50%;
  left: 50%;
}
.clear-button:visited {
  display: inline-block;
  color: #aa7d53;
  text-decoration: none;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 3px solid #aa7d53;
  border-radius: 10px;
}
.clear-button:hover {
  background: #cea77e;
  color: white;
  border: 3px solid #cea77e;
}
.clear-button:active {
  background: #cea77e;
  color: white;
  border: 3px solid #cea77e;
}
</style>
