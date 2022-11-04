# docker-flask-api-boilerplate

Project with bootstrap files to create one python project

## How this works

For now, we don't have any automation to create your project. Just copy and past to your new empty project.

Main features:

 * Unit tests
 * Dockerfile
 * Pylint

## Tests

### For unit tests:

You **need** to have python3 installed.

The version used in this project is `3.10.8`.

```sh
make unit-tests parameters="<filepath>.py <Class>.<Function>"
```
`parameters filepath init after ./tests`

#### Examples

- All tests
  ```sh
  make unit-tests
  ```

- File test
  ```sh
  make unit-test parameters="middleware_test.py"
  ```

- Class of file test
  ```sh
  make unit-test parameters="middleware_test.py ProcessRequestTests"
  ```
  
- Function of class of file test:
  ```sh
  make unit-test parameters="middleware_test.py ProcessRequestTests.test_get_proxy"
  ```

### For integration tests:

```sh
make integration-tests parameters="<filepath>.py <Class>.<Function>"
```
`parameters filepath init after ./tests`

Same unit tests examples works to integration tests.

## lint

To run pylint in your code run:

    make lint