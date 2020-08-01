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
        'is-visible': isTooltipVisible
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
  },
  computed: {
    isTooltipVisible() {
      if (this.message === "") {
        return false;
      }

      if (this.forceVisiblity) {
        return true;
      }

      return this.isHovering;
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
    margin-left: -88px;
    opacity: 0;
    padding: 6px 11px;
    position: absolute;
    text-align: center;
    transition: opacity 0.3s;
    visibility: hidden;
    width: 154px;
    z-index: 1;
    font-size: 21px;

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
