<script setup lang="ts">
import { defineProps } from "vue";
import { BookItem } from "@/types";
import { useCartStore } from "@/stores/CartStore";
import { asDollarsAndCents } from "@/utils";
const cartStore = useCartStore();
const props = defineProps<{
  book: BookItem;
}>();
const getBookImageUrl = function (book: BookItem): string {
  let filename = book.title.toLowerCase();
  filename = filename.replace(/ /g, "-");
  filename = filename.replace(/'/g, "");
  filename = filename + ".gif";
  try {
    return require("@/assets/images/books/" + filename);
  } catch (_) {
    return require("@/assets/images/books/no-img-139-187.gif");
  }
};
</script>
<style scoped>
.book-box {
  display: inline-flex;
  flex-direction: column;
  background-color: var(--card-background-color);
  gap: 0.25em;
}
#book-description {
  display: inline-block;
  position: relative;
  top: -120px;
  padding-left: 20px;
  width: 185px;
}
#book-boxes {
  display: inline-block;
  flex-direction: column;
  background-color: var(--card-background-color);
  padding: 1em;
  gap: 0.25em;
}
#book-image {
  display: inline-block;
  position: relative;
}
.book-title {
  position: relative;
  color: var(--card-text-color);
  font-size: 30px;
}
.book-author {
  font-style: italic;
  position: relative;
  top: 30px;
  color: var(--card-text-color);
  font-size: 20px;
}
.book-price {
  position: relative;
  top: 60px;
  color: var(--card-text-color);
  font-size: 30px;
}
.add-button {
  display: inline-block;
  background: var(--primary-color);
  color: white;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 2px none;
  border-radius: 10px;
  margin-top: 1px;
  position: relative;
  top: 100px;
  font-size: 18px;
}
.add-button:visited {
  display: inline-block;
  background: var(--primary-color);
  color: white;
  text-decoration: none;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 2px none;
  border-radius: 10px;
}
.add-button:hover,
.add-button:active {
  background: var(--primary-color-dark);
  color: white;
}
.read-button {
  display: inline-block;
  background: var(--primary-color);
  color: white;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 2px none;
  border-radius: 10px;
  margin-top: 1px;
  position: relative;
  top: 70px;
  left: 0px;
  font-size: 18px;
  opacity: 0.85;
}
.read-button,
.read-button:visited {
  display: inline-block;
  background: var(--primary-color);
  color: white;
  text-decoration: none;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 2px none;
  border-radius: 10px;
  opacity: 0.9;
}

.read-button:hover,
.read-button:active {
  background: var(--primary-color-dark);
  color: white;
  opacity: 0.9;
}
</style>

<template>
  <li class="book-box">
    <div id="book-boxes">
      <div id="book-image">
        <img :src="getBookImageUrl(book)" :alt="book.title" :width="160" />
        <div
          style="position: absolute; left: 16px; top: 125px"
          v-if="book.isPublic == true"
        >
          <button class="read-button">
            <font-awesome-icon icon="fa-solid fa-book-open" /> Read Now
          </button>
        </div>
      </div>
      <div id="book-description">
        <div class="book-title">{{ book.title }}</div>
        <div class="book-author">{{ book.author }}</div>
        <div class="book-price">{{ asDollarsAndCents(book.price) }}</div>
        <button class="add-button" @click="cartStore.addToCart(book)">
          <font-awesome-icon icon="fa-solid fa-cart-shopping" /> Add to Cart
        </button>
      </div>
    </div>
  </li>
</template>
