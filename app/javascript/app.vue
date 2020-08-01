<template>
  <div id="app">
    <div class="home">
      <div class="logo">
        <h1>Shrinkr</h1>
      </div>
      <div class="url-input">
        <input
          type="text"
          placeholder="Enter url here"
          v-model="url"
          @input="handleUrlChange"
          :readonly="state === 'shrinking'"
        />
        <status-icon
          v-visible="url !== '' || urlStatus === 'error'"

          :status="urlStatus"
          :force-message-visibility="urlStatus === 'error'"
        />
      </div>
      <shrink-button :state="state" @click="handleShrink" />
    </div>
  </div>
</template>

<script>

import service from "@app/service";
import utils from '@app/utils';

import ShrinkButton from "@app/components/ShrinkButton.vue";
import StatusIcon from '@app/components/StatusIcon';

export default {
  components: {
    "shrink-button": ShrinkButton,
    "status-icon": StatusIcon,
  },
  methods: {
    async handleShrink() {
      if (this.state !== 'idle') {
        return;
      }

      if (this.urlStatus !== 'success') {
        this.attempts += 1;
        return;
      }

      this.state = "shrinking";

      try {
        const shortUrl = await service.shrinkUrl(this.url);
        this.url = shortUrl;
        this.state = "completed";

        this.copyUrlToClipboard();
      } catch (err) {
        console.error(err);
        this.state = "failed";
      }
    },

    handleUrlChange() {
      this.state = "idle";
      this.attempts = 0;
    },

    async copyUrlToClipboard() {
      try {
        throw new err;
        await navigator.clipboard.writeText(shortUrl);
      }
      catch (err) {
        console.log(err);
      }
    }
  },

  computed: {
    urlStatus() {
      const isValidUrl = utils.isValidUrl(this.url) // Check valid url here

      if (!isValidUrl && this.attempts === 0) {
        return 'warning';
      }

      if (!isValidUrl && this.attempts >= 1) {
        return 'error';
      }

      return 'success';
    }
  },

  data() {
    return {
      url: "",
      state: "idle",
      attempts: 0,
    };
  }
};
</script>

<style scoped lang="scss">
@import '@app/styles/animations.scss';
@import '@app/styles/variables.scss';

.home {
  font-family: SquadaOne;

  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;

  background-color: $gray;
  height: 100vh;
  width: 100vw;

  .logo {
    @include animation--fadein(0, -100%, 0);

    margin-bottom: 64px;

    h1 {
      font-size: 120px;
      font-weight: normal;

      color: white;
      margin: 0;
    }
  }

  .url-input {
    @include animation--fadein(0, 100%, 0);

    display: flex;
    align-items: center;
    justify-content: center;

    margin-bottom: 16px;


    input {
      font-size: 30px;
      font-family: SquadaOne;

      border-radius: 50px;

      padding: 15px 35px 15px 30px;

      min-width: 600px;

      &:focus {
        outline: none;
      }
    }
  }

  .shrink-button {
    @include animation--fadein(0, 150%, 0);
  }

  .status-icon {
    margin-left: -5%;
  }
}
</style>
