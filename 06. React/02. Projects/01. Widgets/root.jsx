import React from "react";
import Clock from "./frontend/clock.jsx";
import Tabs from "./frontend/tabs.jsx";
import Weather from "./frontend/weather.jsx";
import Autocomplete from "./frontend/autocomplete.jsx";

const Root = () =>  (
  <div>
    <Clock />
    <Weather />
    <div className="interactive">
      <Tabs tabs={[
        {title: "Tab 1", content: "This is the first tab"},
        {title: "Tab 2", content: "This is the second tab"},
        {title: "Tab 3", content: "This is the third tab"}
      ]} />
      <Autocomplete names={["james", "john", "jim", "jessica", "joe", "jill"]} />
    </div>
  </div>
);

export default Root;
