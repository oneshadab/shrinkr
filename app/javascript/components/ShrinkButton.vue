<template>
  <div class="shrink-button">
    <button
      class="status--idle"
      v-if="status === 'idle'"
      v-on:click="onShrink()"
    >
      Shrink
    </button>

    <button
      class="status--shrinking"
      v-if="status === 'shrinking'"
    >
      Shrinking...
    </button>

    <button
      class="status--completed"
      v-if="status === 'completed'"
    >
      Url copied to clipboard!
    </button>

    <button
      class="status--failed"
      v-if="status === 'failed'"
    >
      Something went wrong!
    </button>
  </div>
</template>

<script>
export default {
  props: ['status', 'onShrink'],
}
</script>

<style scoped lang="scss">
.shrink-button {
  button {
    min-width: 250px;



    border-radius: 50px;
    border: none;

    font-family: SquadaOne;
    font-size: 40px;

    padding: 8px 32px;

    &:focus {
      outline: none;
    }

    &.status {
      &--idle {
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
