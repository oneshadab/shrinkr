<template>
  <div
    class="tooltip"
    @mouseenter="isHovering = true"
    @mouseleave="isHovering = false"
  >
    <slot></slot>
    <span
      :class="{
        'tooltip-message': true ,
        'is-visible': forceVisiblity || isHovering
      }"
    >
      {{message}}
    </span>
  </div>
</template>

<script>
export default {
  props: {
    message: {
      type: String,
      default: ""
    },
    forceVisiblity: {
      type: Boolean,
      default: false,
    }
  },
  data() {
    return {
      isHovering: false,
    }
  }
};
</script>

<style scoped lang="scss">
.tooltip {
  position: relative;
  display: inline-block;

  .tooltip-message {
    background-color: #555;
    border-radius: 6px;
    bottom: 125%;
    color: #fff;
    left: 50%;
    margin-left: -60px;
    opacity: 0;
    padding: 5px 0;
    position: absolute;
    text-align: center;
    transition: opacity 0.3s;
    visibility: hidden;
    width: 120px;
    z-index: 1;

    &::after {
      content: "";
      position: absolute;
      top: 100%;
      left: 50%;
      margin-left: -5px;
      border-width: 5px;
      border-style: solid;
      border-color: #555 transparent transparent transparent;
    }
  }

  .is-visible {
    visibility: visible;
    opacity: 1;
  }
}
</style>
