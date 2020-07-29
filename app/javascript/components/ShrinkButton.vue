<template>
  <div class="shrink-button">
    <button
      class="status--idle"
      v-show="status === 'idle'"
      v-on:click="onShrink()"
    >
      Shrink
    </button>

    <button
      class="status--shrinking"
      v-show="status === 'shrinking'"
    >
      <img :src="spinnerIcon" />
      Shrinking...
    </button>

    <button
      class="status--completed"
      v-show="status === 'completed'"
    >
      <img :src="checkIcon" />
      Url copied to clipboard!
    </button>

    <button
      class="status--failed"
      v-show="status === 'failed'"
    >
      <img :src="alertIcon" />
      Something went wrong!
    </button>
  </div>
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
  }
}
</script>

<style scoped lang="scss">
.shrink-button {
  button {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 12px;

    min-width: 250px;

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
      }

      &--shrinking {
        color: white;
        background-color: #a4d4f0;
      }

      &--completed {
        color: white;
        background-color: #2ddb70;
      }

      &--failed {
        color: white;
        background-color: #db412d;
      }
    }
  }
}
</style>
