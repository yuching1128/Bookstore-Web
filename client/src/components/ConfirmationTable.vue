<script setup lang="ts">
import { asDollarsAndCents } from "@/utils";
import { useOrderDetailsStore } from "@/stores/OrderDetailsStore";
import { OrderDetails } from "@/types";

const orderDetailsStore = useOrderDetailsStore();
const orderDetails: OrderDetails = orderDetailsStore.orderDetails;
</script>

<style scoped>
table {
  border: 3px var(--primary-color) solid;
  border-radius: 10px;
  width: fit-content;
  margin-top: 1em;
  margin-bottom: 1em;
  align-self: center;
  border-collapse: collapse;
}

.table-title {
  background-color: var(--primary-color);
  color: whitesmoke;
}

td {
  display: table-cell;
  padding: 0.5em 0.5em;
  background-color: white;
  vertical-align: middle;
}

tr:nth-child(even) > td {
  background-color: #f8f1eb;
}

td:nth-child(1) {
  text-align: center;
}

td:nth-child(2) {
  text-align: center;
}

td:nth-child(3) {
  text-align: center;
}
</style>

<template>
  <table>
    <tr>
      <td class="table-title">Book Title</td>
      <td class="table-title">Quantity</td>
      <td class="table-title">Price</td>
    </tr>
    <tr v-for="(item, index) in orderDetails.lineItems" :key="item.productId">
      <td>
        {{ orderDetails.books[index].title }}
      </td>
      <td>{{ item.quantity }}</td>
      <td>
        {{ asDollarsAndCents(orderDetails.books[index].price * item.quantity) }}
      </td>
    </tr>
  </table>
</template>
