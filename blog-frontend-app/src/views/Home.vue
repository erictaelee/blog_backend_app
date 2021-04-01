<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <a href="/signup">Signup</a> or 
<router-link to="/signup">Signup</router-link>
<p><a href="/login">Login</a> or 
<router-link to="/login">Login</router-link></p>
  </div>
</template>

<style>
</style>

<script>
export default {
  data: function () {
    return {
      message: "Welcome to Vue.js!",
    };
  },
  created: function () {},
  methods: {},
};
</script>