<script setup lang="ts"></script>

<style scoped>
footer {
  background: var(--secondary-background-color);
  display: flex;
  gap: 1em;
  justify-content: center;
  flex-direction: column;
}

.links {
  text-align: center;
}
.but {
  display: inline-block;
  background: var(--primary-color);
  color: white;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 2px none;
  border-radius: 50px;
  width: 50px;
  height: 50px;
  font-size: 25px;
  margin: 4px;
}
.but:visited {
  display: inline-block;
  background: var(--primary-color);
  color: white;
  text-decoration: none;
  padding: 0.5em 0.5em;
  cursor: pointer;
  border: 2px none;
  border-radius: 10px;
}

.but:hover,
.but:active {
  background: var(--primary-color-dark);
  color: white;
}
.link-text {
  font-size: 30px;
  color: var(--primary-color);
  text-decoration: none;
}
.social-media-icons {
  margin-top: 30px;
  flex-direction: row;
  text-align: center;
}

.copy-right {
  height: inherit;
  width: inherit;
  background-color: #a67855;
  text-align: center;
  font-size: 20px;
  color: var(--primary-color);
  padding: 10px;
  margin: -16px;
}
</style>

<template>
  <footer class="container">
    <section class="links">
      <div class="link-text">
        <router-link to="/" style="padding-right: 50px">About</router-link>
        |<router-link to="/">Contact</router-link> |
        <router-link to="/" style="padding-left: 50px">Direction</router-link>
      </div>
      <div class="social-media-icons" style="position: relative; right: 25px">
        <router-link to="/" class="but"
          ><font-awesome-icon icon="fa-brands fa-facebook-f"
        /></router-link>
        <router-link to="/" class="but"
          ><font-awesome-icon icon="fa-brands fa-instagram"
        /></router-link>
        <router-link to="/" class="but"
          ><font-awesome-icon icon="fa-brands fa-twitter"
        /></router-link>
      </div>
    </section>
    <section class="copy-right">
      <font-awesome-icon icon="fa-regular fa-copyright" /> All Rights Reserved
    </section>
  </footer>
</template>
