<script setup lang="ts">
import HomeCategoryList from "../components/HomeCategoryList.vue";
</script>

<style scoped>
.home-page {
  display: flex;
  height: 500px;
}
.category-images {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  gap: 1em;
  float: right;
}
.welcome-text {
  width: 15em;
  margin-top: 10px;
  font-size: 30px;
  color: #807974;
}
</style>
<template>
  <div class="home-page">
    <section class="welcome-text flow-content container">
      <div style="position: relative; width: 600px; height: 500px; top: -75px">
        <img src="@/assets/images//home/home-sunny.png" />
        <div
          style="
            position: absolute;
            width: 500px;
            height: 100px;
            left: 20px;
            top: 80px;
            font-size: larger;
          "
        >
          <h1>Sunny Books<br />shines your days</h1>
        </div>
        <div
          style="
            position: absolute;
            width: 700px;
            height: 100px;
            left: 155px;
            top: 315px;
          "
        >
          <router-link
            to="/category/Best Sellers"
            style="text-decoration: none"
          >
            <h2>Shop now !!</h2>
          </router-link>
        </div>
      </div>
    </section>

    <section class="category-images container">
      <img
        src="@/assets/images/home/home-sunny-right.png"
        alt="home sunny"
        style="position: relative; width: 820px; height: 470px; right: -100px"
      />
    </section>
  </div>
</template>
