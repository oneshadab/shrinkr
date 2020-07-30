<template>
  <span v-html="require(`!html-loader!./../../assets/images/icons/${name}.svg`)"></span>
</template>

<script>
export default {
  props: ['name']
}
</script>
