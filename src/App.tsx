import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Homepage from "./components/Homepage";
import DeviceList from "./components/DeviceList";
import GlobalContextsProvider from "./components/plasmic/cypress_app_jiyi_build/PlasmicGlobalContextsProvider";

function App() {
  return (
    <GlobalContextsProvider>
      <Router>
        <Routes>
          <Route path="/" element={<Homepage />} />
          <Route path="/device-list" element={<DeviceList />} />
        </Routes>
      </Router>
    </GlobalContextsProvider>
  );
}

export default App;
