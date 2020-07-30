
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
          :readonly="status === 'shrinking'"
        />
      </div>
      <shrink-button :status="status" :on-shrink="handleShrink" />
    </div>
  </div>
</template>

<script>
import ShrinkButton from "./components/ShrinkButton.vue";
import { shrinkUrl } from "./service";

export default {
  components: {
    "shrink-button": ShrinkButton
  },
  methods: {
    async handleShrink() {
      this.status = "shrinking";

      try {
        const shortUrl = await shrinkUrl(this.url);
        await navigator.clipboard.writeText(shortUrl);

        this.url = shortUrl;
        this.status = "completed";
      } catch (err) {
        console.error(err);
        this.status = "failed";
      }
    },

    handleUrlChange() {
      this.status = "idle";
    }
  },

  data() {
    return {
      url: "",
      status: "idle"
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

    input {
      font-size: 30px;
      font-family: SquadaOne;

      border-radius: 50px;

      padding: 15px 25px;

      min-width: 600px;

      margin-bottom: 16px;

      &:focus {
        outline: none;
      }
    }
  }

  .shrink-button {
    @include animation--fadein(0, 150%, 0);
  }
}
</style>
