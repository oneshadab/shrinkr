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
      <img :src="spinnerIcon" />
      Shrinking...
    </span>

    <span
      v-show="status === 'completed'"
    >
      <img :src="checkIcon" />
      Url copied to clipboard!
    </span>

    <span
      v-show="status === 'failed'"
    >
      <img :src="alertIcon" />
      Something went wrong!
    </span>
  </button>
</template>

<script>
import spinnerIcon from 'images/icons/spinner.svg';
import checkIcon from 'images/icons/check.svg';
import alertIcon from 'images/icons/alert.svg';


export default {
  props: ['status', 'onShrink'],
  data() {
    return {
      spinnerIcon,
      checkIcon,
      alertIcon,
    }
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
  gap: 12px;

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

  img {
    color: white;
    height: 32px;
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
