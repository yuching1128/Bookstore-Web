<script setup lang="ts">
import { useRoute } from "vue-router";
const route = useRoute();
import { useCategoryStore } from "@/stores/CategoryStore";
const categoryStore = useCategoryStore();
</script>

<style scoped>
.category-buttons {
  display: flex;
  flex-direction: row;
  text-align: center;
  background-color: var(--neutral-color);
  font-size: 25px;
}

.button.selected-category-button {
  background-color: var(--primary-color);
}

.button.unselected-category-button,
.button.unselected-category-button:visited {
  background-color: var(--neutral-color);
}

.button.unselected-category-button:hover,
.button.unselected-category-button:active {
  background-color: var(--card-text-color);
}
</style>

<template>
  <nav>
    <ul class="category-buttons">
      <li
        v-for="category in categoryStore.categoryList"
        :key="category.categoryId"
      >
        <router-link
          :to="{ name: 'category-view', params: { name: category.name } }"
          class="button category-buttons selected-category-button"
          v-if="route.params.name === category.name"
        >
          {{ category.name }}
        </router-link>
        <router-link
          :to="{ name: 'category-view', params: { name: category.name } }"
          class="button category-buttons unselected-category-button"
          v-if="route.params.name !== category.name"
        >
          {{ category.name }}
        </router-link>
      </li>
    </ul>
  </nav>
</template>
