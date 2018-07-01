<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\MinkContext;

use Behat\Mink\Exception\ExpectationException;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends MinkContext
{
  public function spins($closure, $tries = 10)
  {
      for ($i = 0; $i <= $tries; $i++) {
          try {
              $closure();

              return;
          } catch (\Exception $e) {
              if ($i == $tries) {
                  throw $e;
              }
          }

          sleep(1);
      }
  }

  protected function throwExpectationException($message)
  {
    throw new ExpectationException($message, $this->getSession());
  }

  public function __call($method, $parameters)
  {
    // we try to call the method on the Page first
    $page = $this->getSession()->getPage();
    if (method_exists($page, $method)) {
        return call_user_func_array(array($page, $method), $parameters);
    }

    // we try to call the method on the Session
    $session = $this->getSession();
    if (method_exists($session, $method)) {
        return call_user_func_array(array($session, $method), $parameters);
    }

    // could not find the method at all
    throw new \RuntimeException(sprintf(
        'The "%s()" method does not exist.', $method
    ));
  }

    /**
     * @Given I wait :arg1 seconds
     */
    public function iWaitSeconds($arg1)
    {
        $this->getSession()->wait(1000*$arg1);
    }

    /**
     * @Given I click on an :arg1 element
     */
    public function iClickOnAnElement($arg1)
    {
        $element = $this->find('css', $arg1);
        if (!$element) {
            throw \Exception('Element is not there yet :(');
        }
        $element->click();
    }

    /** EXAMPLE
     * @When something long is taking long but should output :text

    public function somethingLongShouldOutput($text)
    {
        $this->find('css', 'button#longStuff')->click();

        $this->spins(function() use ($text) {
            $this->assertSession()->pageTextContains($text);
        });
    }
    */

    /**
     * @Then do something on a button that might not be there yet

    public function doSomethingNotThereYet()
    {
        $this->spins(function() {
            $button = $this->find('css', 'button#mightNotBeThereYet');
            if (!$button) {
                throw \Exception('Button is not there yet :(');
            }
            $button->click();
        });
    }
    */


    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
    }
}
