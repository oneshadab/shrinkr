
<template>
  <div id="app">
    <div class="home">
      <div class="logo">
        <h1>Shrinkr</h1>
      </div>
      <div class="url-input">
        <input type="text" placeholder="Enter url here" v-model="url">
      </div>
      <div class="shrink-button">
        <button v-on:click="handleShrink()">Shrink</button>
      </div>
    </div>
  </div>
</template>

<script>
import { shrinkUrl } from './service';

export default {
  methods: {
    async handleShrink() {
      const newUrl = await shrinkUrl(this.url);
      this.url = newUrl;
    }
  },

  data() {
    return {
      url: undefined,
    }
  }
}
</script>

<style scoped lang="scss">
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
    margin-bottom: 64px;

    h1 {
      font-size: 120px;
      font-weight: normal;

      color: white;
      margin: 0;
    }
  }

  .url-input {
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
}





</style>
