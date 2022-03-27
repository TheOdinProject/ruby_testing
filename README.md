# RSpec Playground
The purpose of this repository is to provide 'hands-on' RSpec lessons. These lessons were designed to equip students of the [The Odin Project](https://www.theodinproject.com/) to write tests for their Tic-Tac-Toe and to TDD their Connect Four.

## Topics
These lessons cover many topics, but it does not cover everything that RSpec is capable of testing. You should expect to learn foundational knowledge on the following topics:
- Let Variables
- Implicit and Explicit Subject
- A variety of built-in-matchers
- Setting values for instance variables to create test conditions
- The 'Arrange, Act & Assert' testing pattern
- Stubs, Mocks, and Doubles
- Test Driven Development

## Set-Up
Run `rbenv versions` to confirm that you have ruby version 3.0.3 installed. If you do not have this version installed, please refer back to these [instructions](https://www.theodinproject.com/lessons/ruby-installing-ruby) to install it.

Run `bundle install` from the root directory.

## How to use this playground
These lessons are numbered 01 - 16, in the **spec** folder. Start with the file: <code>spec/01_string_spec.rb</code>. The first 9 lessons are self-contained in the spec file. Starting with lesson 10, there will be 1-3 corresponding files in the <code>lib</code> folder.

If you get stuck on a lesson, there is a corresponding answer file located in the <code>spec_answer</code> folder.

## Running Tests
Since this repository is full of tests, it is recommended to only run <code>rspec</code> on one individual file at at time. For example, to run the first test file from the root of this directory:

<pre><code>rspec spec/01_string_spec.rb</code></pre>

Tip: If you have tab completion set-up, you can hit 'tab' after the first few characters of the file name.
