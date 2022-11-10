<script setup lang="ts">
import { defineProps, Ref } from "vue";
import { Validation } from "@vuelidate/core";

const props = defineProps<{
  fieldName: string;
  validator: Ref<Validation>;
}>();
</script>

<style scoped>
form > .error {
  color: #ef5f25;
  text-align: right;
  padding-right: 100px;
  padding-bottom: 15px;
  font-size: 20px;
  margin-top: -15px;
  font-style: italic;
}
</style>

<template>
  <template v-if="validator[fieldName].$error">
    <span
      class="error"
      v-for="error of validator[fieldName].$errors"
      :key="error.$uid"
      >{{ error.$message }}</span
    >
  </template>
</template>
