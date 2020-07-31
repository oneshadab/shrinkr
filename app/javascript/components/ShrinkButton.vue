<template>

  <button
    :class="['shrink-button', `status--${status}`]"
    v-on:click="handleClick"
  >
    <span
      v-show="status === 'idle'"
    >
      Shrink
    </span>

    <span
      v-show="status === 'shrinking'"
    >
      <icon name="spinner" />
      Shrinking...
    </span>

    <span
      v-show="status === 'completed'"
    >
      <icon name="check" />
      Url copied to clipboard!
    </span>

    <span
      v-show="status === 'failed'"
    >
      <icon name="alert" />
      Something went wrong!
    </span>
  </button>
</template>

<script>
import Icon from './Icon.vue';


export default {
  props: ['status', 'onShrink'],
  components: {
    'icon': Icon
  },
  methods: {
    handleClick() {
      if (this.status !== 'idle') {
        return;
      }

      this.onShrink();
    }
  }
}
</script>

<style scoped lang="scss">
button.shrink-button {
  display: flex;
  justify-content: center;
  align-items: center;

  min-width: 250px;
  width: 100%;
  transition: max-width .5s;

  max-height: 56px;
  white-space: nowrap;
  overflow: hidden;


  border-radius: 50px;
  border: none;

  font-family: SquadaOne;
  font-size: 40px;

  padding: 8px 32px;

  &:focus {
    outline: none;
  }

  span {
    display: inline-flex;
    justify-content: center;
    align-items: center;
    gap: 12px;

  }

  &.status {
    &--idle {
      &:hover {
        cursor: pointer;
      }

      color: white;
      background-color: #2D9CDB;

      max-width: 300px;
    }

    &--shrinking {
      color: white;
      background-color: #a4d4f0;

      max-width: 400px;
    }

    &--completed {
      color: white;
      background-color: #2ddb70;

      max-width: 500px;
    }

    &--failed {
      color: white;
      background-color: #db412d;

      max-width: 500px;
    }
  }
}
</style>
