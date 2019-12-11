<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
export default {
  el: "application",
  data: function () {
    return {
      message: "Hello Vue!"
    }
  },
  mounted: function () {

  }
}
</script>
