<template>
  <tooltip class="status-icon" message="That doesn't look like a valid url">
    <icon :name="name" :color="color" :size="24" />
  </tooltip>
</template>

<script>
import Icon from './Icon';
import Tooltip from './Tooltip';


export default {
  components: {
    'icon': Icon,
    'tooltip': Tooltip,
  },

  props: {
    status: {
      type: String,
      default: "success"
    }
  },

  computed: {
    color() {
      const colorFor = {
        success: 'green',
        warning: 'gray',
        error: 'red',
      };
      return colorFor[this.status];
    },
    name() {
      const nameFor = {
        success: 'check',
        warning: 'alert',
        error: 'alert',
      };
      return nameFor[this.status];
    }
  }
}
</script>

<style scoped>

</style>
