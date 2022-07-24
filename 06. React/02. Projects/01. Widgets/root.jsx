import React from "react";
import Clock from "./frontend/clock.jsx";
import Tabs from "./frontend/tabs.jsx";

const Root = () =>  (
  <div>
    <Clock />
    <Tabs tabs={[
      {title: "Tab 1", content: "This is the first tab"},
      {title: "Tab 2", content: "This is the second tab"},
      {title: "Tab 3", content: "This is the third tab"}
    ]} />
  </div>
);

export default Root;
