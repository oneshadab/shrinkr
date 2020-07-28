<template>
  <div class="shrink-button">
    <button v-if="status === 'idle'" v-on:click="onShrink()">Shrink</button>
    <button v-if="status === 'shrinking'">Shrinking...</button>
    <button v-if="status === 'completed'">Url copied to clipboard!</button>
    <button v-if="status === 'failed'">Something went wrong!</button>
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

    color: white;
    background-color: #2D9CDB;

    border-radius: 50px;
    border: none;

    font-family: SquadaOne;
    font-size: 40px;

    padding: 8px 32px;

    &:focus {
      outline: none;
    }
  }
}
</style>
