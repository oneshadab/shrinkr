<template>
  <tooltip
    class="status-icon"
    :message="message"
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
        success: 'check-circled',
        warning: 'alert',
        error: 'alert',
      };
      return nameFor[this.status];
    },

    message() {
      const messageFor = {
        success: "",
        warning: "That doesn't look like a valid url",
        error: "That doesn't look like a valid url",
      }
      return messageFor[this.status];
    }
  }
}
</script>

<style scoped lang="scss">
@import '@app/styles/variables.scss';

.status-success {
  color: $darkGreen;
}

.status-warning {
  color: $gray;
}

.status-error {
  color: $red;
}

</style>
