<script setup lang="ts">
import HeaderDropdown from "@/components/HeaderDropdown.vue";
import { useCartStore } from "@/stores/CartStore";
const cartStore = useCartStore();
</script>

<style scoped>
header {
  background: #f2ebe6;
  display: flex;
  padding: 1em;
  gap: 1em;
  justify-content: space-between;
  font-size: 23px;
  color: var(--primary-color);
}

.logo-image {
  float: left;
}

.logo-text {
  float: left;
  padding: 5px;
  margin-top: 3px;
}

.bookstore-name {
  font-family: var(--default-font-family);
  display: inline-block;
  text-align: left;
  float: left;
}

.search-bar {
  text-align: center;
  margin-top: 20px;
  font-size: 25px;
}

.search-bar button {
  float: left;
  width: 13%;
  padding: 0.33em;
  background: var(--primary-color);
  color: white;
  font-size: 20px;
  border-radius: 10px 0px 0px 10px;
  border: 4px solid var(--primary-color-dark);
  border-right: none;
}

.search-bar button:visited {
  display: inline-block;
  background: var(--primary-color);
  color: white;
  text-decoration: none;
  cursor: pointer;
}

.search-bar button:hover,
.search-bar button:active {
  background: var(--primary-color-dark);
  color: white;
}

.search-bar input[type="text"] {
  padding: 4px;
  font-size: 26px;
  border: 4px solid var(--primary-color-dark);
  float: left;
  width: 35%;
  background: #f1f1f1;
  border-radius: 0px 10px 10px 0px;
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
}

.search-bar input[type="text"]:focus {
  padding: 4px;
  font-size: 26px;
  border: 4px solid var(--primary-color-dark);
  float: left;
  background: #f1f1f1;
  border-radius: 0px 10px 10px 0px;
  width: 80%;
}

.header-button,
.header-button:visited {
  display: inline-block;
  background: var(--primary-color);
  color: white;
  text-decoration: none;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 2px none;
  border-radius: 10px;
  margin-left: 4px;
}

.header-button:hover {
  background: var(--primary-color-dark);
  color: white;
}

.header-button:active {
  background: var(--primary-color-dark);
  color: white;
}

.header-dropdown-and-cart {
  text-align: right;
  margin-top: 10px;
}

@media (max-width: 600px) {
  header {
    flex-direction: column;
  }
}
</style>

<template>
  <header class="container">
    <section>
      <div class="logo-image">
        <router-link to="/">
          <img
            src="@/assets/images/site/logo.png"
            alt="Sunny Books Logo"
            width="70"
            height="auto"
          />
        </router-link>
      </div>
      <div class="logo-text">
        <router-link to="/">
          <h1 class="bookstore-name">Sunny</h1>
          <br />
          <h1 class="bookstore-name">Books</h1>
        </router-link>
      </div>
    </section>
    <section class="search-bar">
      <form>
        <button type="submit">
          <font-awesome-icon icon="fa-solid fa-magnifying-glass" />
        </button>
        <input type="text" placeholder="Search..." />
      </form>
    </section>
    <section class="header-dropdown-and-cart">
      <header-dropdown></header-dropdown>
      <router-link to="/cart">
        <button class="header-button">
          <font-awesome-icon icon="fa-solid fa-cart-shopping" /> cart ({{
            cartStore.count
          }})
        </button>
      </router-link>
      <button class="header-button">
        <font-awesome-icon icon="fa-solid fa-user" /> login
      </button>
    </section>
  </header>
</template>
