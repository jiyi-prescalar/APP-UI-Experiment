
import Homepage from './components/Homepage';
import GlobalContextsProvider from './components/plasmic/cypress_app_jiyi_build/PlasmicGlobalContextsProvider'

function App() {
  return (<GlobalContextsProvider><Homepage /></GlobalContextsProvider>);
}

export default App;
  