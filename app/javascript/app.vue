
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
        <status-icon :status="urlStatus" />
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
    }
  },

  computed: {
    urlStatus() {
      if (this.url === 'test') {
        return "success";
      }
      return "error";
    }
  },

  data() {
    return {
      url: "",
      state: "idle",
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
