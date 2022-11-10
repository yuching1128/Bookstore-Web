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

.text-logo {
  font-family: var(--title-font-family);
  display: inline-block;
  text-align: left;
  float: left;
}

#logo-image {
  float: left;
}

#logo-text {
  float: left;
  padding: 5px;
  margin-top: 3px;
}

.title-and-search-bar {
  text-align: center;
  margin-top: 20px;
  font-size: 25px;
}

.header-dropdown-and-cart {
  text-align: right;
  margin-top: 10px;
}

.button-header,
.button-header:visited {
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
.button-header:hover {
  background: var(--primary-color-dark);
  color: white;
}
.button-header:active {
  background: var(--primary-color-dark);
  color: white;
}
.title-and-search-bar button {
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

.title-and-search-bar button:visited {
  display: inline-block;
  background: var(--primary-color);
  color: white;
  text-decoration: none;
  cursor: pointer;
}

.title-and-search-bar button:hover,
.title-and-search-bar button:active {
  background: var(--primary-color-dark);
  color: white;
}
.title-and-search-bar input[type="text"] {
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
.title-and-search-bar input[type="text"]:focus {
  padding: 4px;
  font-size: 26px;
  border: 4px solid var(--primary-color-dark);
  float: left;
  background: #f1f1f1;
  border-radius: 0px 10px 10px 0px;
  width: 80%;
}
@media (max-width: 600px) {
  header {
    flex-direction: column;
  }
}
</style>

<template>
  <header class="container">
    <section class="bookstore-logo">
      <div id="logo-image">
        <router-link to="/">
          <img
            src="@/assets/images/site/logo.png"
            alt="Sunny Books Logo"
            width="70"
            height="auto"
          />
        </router-link>
      </div>
      <div id="logo-text">
        <router-link to="/">
          <h1 class="text-logo">Sunny</h1>
          <br />
          <h1 class="text-logo">Books</h1>
        </router-link>
      </div>
    </section>
    <section class="title-and-search-bar">
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
        <button class="button-header">
          <font-awesome-icon icon="fa-solid fa-cart-shopping" /> cart ({{
            cartStore.count
          }})
        </button>
      </router-link>
      <button class="button-header">
        <font-awesome-icon icon="fa-solid fa-user" /> login
      </button>
    </section>
  </header>
</template>
