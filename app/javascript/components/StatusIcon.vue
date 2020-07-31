<template>
  <tooltip
    class="status-icon"
    message="That doesn't look like a valid url"
    :forceVisiblity="forceMessageVisibility"
  >
    <icon :class="[`status-${status}`]" :name="name" :size="24" />
  </tooltip>
</template>

<script>
import Icon from '@app/components/Icon';
import Tooltip from '@app/components/Tooltip';


export default {
  components: {
    'icon': Icon,
    'tooltip': Tooltip,
  },

  props: {
    status: {
      type: String,
      default: "success"
    },
    forceMessageVisibility: {
      type: Boolean,
      default: false,
    }
  },

  computed: {
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

<style scoped lang="scss">
@import '@app/styles/variables.scss';

.status-success {
  color: $green;
}

.status-warning {
  color: $gray;
}

.status-error {
  color: $red;
}

</style>
