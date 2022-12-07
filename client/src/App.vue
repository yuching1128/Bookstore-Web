<script setup lang="ts">
import AppHeader from "@/components/AppHeader.vue";
import AppFooter from "@/components/AppFooter.vue";
import AppNavBar from "@/components/AppNavBar.vue";
import { useRoute } from "vue-router";
import { useCategoryStore } from "@/stores/CategoryStore";

const route = useRoute();
const categoryStore = useCategoryStore();
categoryStore.fetchCategories();
</script>
<style></style>

<!--suppress SassScssResolvedByNameOnly -->
<template>
  <div id="app">
    <app-header />
    <router-view :key="$route.fullPath" />
    <app-footer />
  </div>
</template>
