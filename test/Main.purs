module Test.Main where

import Prelude
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Exception (EXCEPTION)
import Control.Monad.Eff.Random (RANDOM)
import Control.Monad.Eff.Ref (REF)
import DOM (DOM)
import Snabbdom (VDOM)
import Test.DomEventSpec (domEventSuite)
import Test.LifecycleHookSpec (lifecycleHookSuite)
import Test.OutWatchDomSpec (outWatchDomSuite)
import Test.ScenarioTestSpec (scenarioSuite)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (exit, runTest)

main :: forall e. Eff (console :: CONSOLE, testOutput :: TESTOUTPUT, avar :: AVAR
  , dom :: DOM, vdom :: VDOM, random :: RANDOM, ref :: REF, err :: EXCEPTION | e) Unit
main = do
  runTest do
    lifecycleHookSuite
    outWatchDomSuite
    domEventSuite
    scenarioSuite
  (exit 0)
