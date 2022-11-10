<script setup lang="ts">
import { asDollarsAndCents } from "@/utils";
import { useCartStore } from "@/stores/CartStore";
const cartStore = useCartStore();
import { BookItem } from "@/types";

const bookImageFileName = function (book: BookItem): string {
  let name = book.title.toLowerCase();
  name = name.replace(/ /g, "-");
  name = name.replace(/'/g, "");
  return `${name}.gif`;
};
const updateCart = function (book: BookItem, quantity: number) {
  cartStore.cart.update(book, quantity);
};
</script>

<style scoped>
.cart-table {
  display: grid;
  grid-template-columns: max-content minmax(10em, 20em) repeat(3, max-content);
  row-gap: 1em;
  width: fit-content;
  margin: 0 auto;
}

ul {
  display: contents;
}

ul > li {
  display: contents;
}

.table-heading {
  background-color: #333;
  color: white;
}

.table-heading > * {
  background-color: var(--neutral-color);
  padding: 0.5em;
}

.heading-book {
  grid-column: 1 / 3;
  padding-left: 40px;
  font-size: 23px;
}

.heading-price {
  grid-column: 3 / 4;
  text-align: center;
  padding-right: 25px;
  font-size: 23px;
}
.heading-quantity {
  grid-column: 4 / 5;
  text-align: center;
  font-size: 23px;
}
.heading-subtotal {
  text-align: right;
  grid-column: -2 / -1;
  font-size: 23px;
}

.cart-book-image {
  padding: 0 1em;
}

.cart-book-image > * {
  margin-left: auto;
  margin-right: 0;
}

img {
  display: block;
  width: 100px;
  height: auto;
}

.rect {
  background-color: var(--primary-color-dark);
}

.narrow-rect {
  width: 75px;
  height: 100px;
}

.square {
  width: 100px;
  height: 100px;
}

.wide-rect {
  width: 125px;
  height: 100px;
}

.cart-book-price {
  text-align: right;
  padding-top: 10px;
  padding-right: 1em;
  font-size: 23px;
}
.cart-book-title {
  padding-top: 10px;
  font-size: 23px;
}
.cart-book-quantity {
  padding-top: 2px;
  padding-left: 1em;
  padding-right: 1em;
  font-size: 28px;
}

.cart-book-subtotal {
  text-align: right;
  padding-top: 10px;
  padding-left: 1em;
  padding-right: 1em;
  font-size: 23px;
}
.cart-book-total-price {
  padding-left: 660px;
  font-size: 23px;
}
/* Row separators in the table */

.line-sep {
  display: block;
  height: 2px;
  background-color: gray;
  grid-column: 1 / -1;
}

/* Increment/decrement buttons */

.icon-button {
  color: var(--primary-color);
  font-size: 23px;
  border: none;
  cursor: pointer;
  background-color: transparent;
  padding-top: 6px;
}

.inc-button {
  margin-right: 0.25em;
}

.inc-button:hover {
  color: var(--primary-color-dark);
}

.dec-button {
  color: #ccc;
}

.dec-button:hover {
  color: #aaa;
}

/* Chevron buttons */

.dec-arrow-button,
.inc-arrow-button {
  font-size: 1rem;
  color: var(--primary-color);
}

.dec-arrow-button:hover,
.inc-arrow-button:hover {
  color: var(--primary-color-dark);
}

input[type="number"] {
  width: 4em;
}

select {
  background-color: var(--primary-color);
  color: white;
  border: 2px solid var(--primary-color-dark);
  border-radius: 3px;
}
</style>

<template>
  <div class="cart-table">
    <ul>
      <li class="table-heading">
        <div class="heading-book">Book</div>
        <div class="heading-price">Price</div>
        <div class="heading-quantity">Quantity</div>
        <div class="heading-subtotal">Amount</div>
      </li>

      <template v-for="item in cartStore.cart.items" :key="item.book.bookId">
        <li>
          <div class="cart-book-image">
            <img
              :src="
                require('@/assets/images/books/' + bookImageFileName(item.book))
              "
              :alt="item.book.title"
              width="100px"
              height="auto"
            />
          </div>
          <div class="cart-book-title">{{ item.book.title }}</div>
          <div class="cart-book-price">
            {{ asDollarsAndCents(item.book.price) }}
          </div>
          <div class="cart-book-quantity">
            <button
              class="icon-button inc-button"
              @click="cartStore.addToCart(item.book)"
            >
              <font-awesome-icon icon="fa-solid fa-circle-plus" />
            </button>
            <span class="quantity">{{ item.quantity }}</span
            >&nbsp;

            <button
              class="icon-button dec-button"
              @click="
                cartStore.updateBookQuantity(item.book, item.quantity - 1)
              "
            >
              <font-awesome-icon icon="fa-solid fa-circle-minus" />
            </button>
          </div>
          <div class="cart-book-subtotal">
            {{ asDollarsAndCents(item.quantity * item.book.price) }}
          </div>
        </li>
        <li class="line-sep"></li>
      </template>

      <li class="line-sep"></li>
      <li class="total-bar">
        <div style="font-size: 23px">Total</div>
        <div class="cart-book-total-price">
          {{ asDollarsAndCents(cartStore.cart.total) }}
        </div>
      </li>
    </ul>
  </div>
</template>
