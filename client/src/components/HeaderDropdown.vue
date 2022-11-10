<script setup lang="ts">
import { inject } from "vue";
import { useCategoryStore } from "@/stores/CategoryStore";
const categoryStore = useCategoryStore();
</script>

<style scoped>
.header-dropdown {
  position: relative;
  display: inline-block;
}

.categories-button {
  background-color: var(--primary-color-dark);
  margin-top: 0.25em;
}

.categories-button:hover {
  background-color: var(--card-text-color);
  color: white;
}
.header-dropdown ul {
  background-color: white;
  color: black;
  display: none;
}

.header-dropdown li {
  padding: 0.25em 0.25em;
  text-align: center;
  background: whitesmoke;
}

.header-dropdown a {
  color: black;
  text-decoration: none;
}

.header-dropdown li:hover {
  transition-duration: 0.5s;
}

.header-dropdown:hover ul {
  display: block;
  position: absolute;
  min-width: 7em;
  z-index: 1;
  cursor: pointer;
}

.header-dropdown.unselected-link {
  display: block;
  height: 25px;
  border-radius: 8px;
  color: var(--neutral-color);
  background-color: whitesmoke;
  text-decoration: none;
  font-size: 25px;
}
.header-dropdown.unselected-link:hover,
.header-dropdown.unselected-link:active {
  display: block;
  height: 35px;
  font-size: large;
  text-align: center;
  transition: all 250ms;
  color: whitesmoke;
  background-color: var(--neutral-color);
  text-decoration: none;
  font-size: 25px;
}
</style>

<template>
  <div class="header-dropdown">
    <button class="button categories-button">
      <font-awesome-icon icon="fa-solid fa-bars" /> Categories
    </button>
    <ul>
      <li
        v-for="category in categoryStore.categoryList"
        :key="category.categoryId"
      >
        <router-link
          :to="'../category/' + category.name"
          class="header-dropdown unselected-link"
        >
          {{ category.name }}
        </router-link>
      </li>
    </ul>
  </div>
</template>
