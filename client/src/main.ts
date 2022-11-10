import { createApp } from "vue";
import { createPinia } from "pinia";
import "@/assets/css/global.css"; // imports the global CSS before all other CSS files
import App from "./App.vue";
import router from "./router";
import { library } from "@fortawesome/fontawesome-svg-core";
// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-ignore
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { faMagnifyingGlass } from "@fortawesome/free-solid-svg-icons";
import { faCartShopping } from "@fortawesome/free-solid-svg-icons";
import { faUser } from "@fortawesome/free-solid-svg-icons";
import { faBars } from "@fortawesome/free-solid-svg-icons";
import { faFacebookF } from "@fortawesome/free-brands-svg-icons";
import { faInstagram } from "@fortawesome/free-brands-svg-icons";
import { faTwitter } from "@fortawesome/free-brands-svg-icons";
import { faBookOpen } from "@fortawesome/free-solid-svg-icons";
import { faCopyright } from "@fortawesome/free-regular-svg-icons";
import { faCirclePlus } from "@fortawesome/free-solid-svg-icons";
import { faCircleMinus } from "@fortawesome/free-solid-svg-icons";
import { faCircleArrowRight } from "@fortawesome/free-solid-svg-icons";
import { faCircleArrowLeft } from "@fortawesome/free-solid-svg-icons";
import { faMoneyCheckDollar } from "@fortawesome/free-solid-svg-icons";
import { faTriangleExclamation } from "@fortawesome/free-solid-svg-icons";

library.add(faMagnifyingGlass);
library.add(faCartShopping);
library.add(faUser);
library.add(faBars);
library.add(faFacebookF);
library.add(faInstagram);
library.add(faTwitter);
library.add(faBookOpen);
library.add(faCopyright);
library.add(faCirclePlus);
library.add(faCircleMinus);
library.add(faCircleArrowRight);
library.add(faCircleArrowLeft);
library.add(faMoneyCheckDollar);
library.add(faTriangleExclamation);

const pinia = createPinia();
const app = createApp(App);
app.use(router);
app.use(pinia);
app.component("font-awesome-icon", FontAwesomeIcon);
app.mount("#app");

// createApp(App)
//   .use(router)
//   .component("font-awesome-icon", FontAwesomeIcon)
//   .mount("#app");
