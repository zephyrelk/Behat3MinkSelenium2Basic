# Behat3MinkSelenium2Basic
---
Behat 3, Mink, Selenium2, Browser Control on actual Chrome Browser on a single local machine.
This is basic example, working as of 7/1/2018.
**(Note that as time goes on the versions of components that work together changes, this is an issue I had with almost all examples I tried)**

This project was about going from zero knowledge about Behat and Mink combined with Selenium on a Linux system, to a basic,  functioning test automation setup that launches a browser and runs some basic tests within that browser.

__Steps Achieved:__
1. Determine a combination of Behat, Mink and Selenium2 that would run together.
2. Do basic, non-browser test on 'ls' command to establish basic functionality.
3. Do headless browser test on Wikipedia search to establish basic website test.
4. Do tests on a non-tutorial site
..* Tests were created that work on filling form, but could not get to query results*
..* As tests were only using goutte headless extension, limited access to page*  
5. Determine how to get Selenium2 extention working with Selenium server, to control actual browser, to be able to access full page.


**Setup/components/versions**
1. Behat 3 (see composer.json for more version information)
2. java 1.8
3. php 7
4. selenium-server-standalone-3.13.0.jar placed in directory "X"
5. ChromeDriver 2.40 (Supports Chrome v66-68) placed in directory "X" (with the jar file above)
6. Chrome (a supported version, in this case, 67)

#Run notes
This is a single machine setup.  This is
run selenium server similar to below, prior to running behat tests
java -jar (Path to dirctory "X")/selenium-server-standalone-*.jar

**Other objectives not addressed yet**
1. be able to run test on Firefox and IE as well.
2. add/update code to spin on elements not seen yet, such that test proceeds as soon as possible
3. running multiple browsers in parallel
4. further understand and implement organizing code into multiple context files
  
