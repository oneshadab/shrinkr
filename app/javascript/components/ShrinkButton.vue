<template>
  <button
    :class="['shrink-button', `state--${state}`]"
    @click="$emit('click')"
  >
    <span
      v-show="state === 'idle'"
    >
      Shrink
    </span>

    <span
      v-show="state === 'shrinking'"
    >
      <icon name="spinner" />
      Shrinking...
    </span>

    <span
      v-show="state === 'completed'"
    >
      <icon name="check" />
      Url copied to clipboard!
    </span>

    <span
      v-show="state === 'failed'"
    >
      <icon name="alert" />
      Something went wrong!
    </span>
  </button>
</template>

<script>
import Icon from '@app/components/Icon.vue';


export default {
  props: {
    state: {
      type: String
    },
  },
  components: {
    'icon': Icon
  },
}
</script>

<style scoped lang="scss">
@import '@app/styles/variables.scss';

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

    span {
      margin-right: 12px;
    }
  }

  &:hover {
    cursor: pointer;
  }

  &.state {
    &--idle {

      color: white;
      background-color: $blue;

      max-width: 300px;
    }

    &--shrinking {
      color: white;
      background-color: $lightBlue;

      max-width: 400px;
    }

    &--completed {
      color: white;
      background-color: $green;

      max-width: 500px;
    }

    &--failed {
      color: white;
      background-color: $red;

      max-width: 500px;
    }
  }
}
</style>
