<template>
  <span v-html="require(`!html-loader!./../../assets/images/icons/${name}.svg`)" :style="inlineStyle"></span>
</template>

<script>
export default {
  props: {
    name: {
      type: String,
      required: true
    },
    size: {
      type: Number,
      default: 32,
    },
    color: {
      type: String,
    }
  },

  computed: {
    inlineStyle() {
      return {
        '--color': this.color,
        '--size': `${this.size}px`
      }
    }
  }
}
</script>

<style scoped>
span {
  display: inline-flex;
  justify-content: center;
  align-items: center;

  height: var(--size);
  width: var(--size);
  color: var(--color);
}

span >>> svg {
  height: var(--size);
  width: var(--size);
}

span >>> svg path {
  fill: currentColor;
}
</style>
