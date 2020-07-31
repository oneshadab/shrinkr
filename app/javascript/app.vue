
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
import { shrinkUrl } from "./service";

import ShrinkButton from "./components/ShrinkButton.vue";
import StatusIcon from './components/StatusIcon';

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
        const shortUrl = await shrinkUrl(this.url);
        await navigator.clipboard.writeText(shortUrl);

        this.url = shortUrl;
        this.state = "completed";
      } catch (err) {
        console.error(err);
        this.state = "failed";
      }
    },

    handleUrlChange() {
      this.state = "idle";
      this.attempts = 0;
    },
  },

  computed: {
    urlStatus() {
      const isValidUrl = (this.url === 'test') // Check valid url here

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
@import './styles/animations.scss';

.home {
  font-family: SquadaOne;

  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;

  background-color: #333333;
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
