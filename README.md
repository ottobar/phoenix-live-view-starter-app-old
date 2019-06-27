# Phoenix Live Page Starter App
This starter app uses:

  * [Visual Studio Code](https://code.visualstudio.com) for code editing
  * Development in [Docker containers](https://www.docker.com) via the [Remote Development Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
  * [ElixirLS for VS Code](https://github.com/JakeBecker/vscode-elixir-ls) for Elixir support in VS Code
  * [ExGuard](https://hex.pm/packages/ex_guard) to automatically run tests, etc.
  * [Bootstrap](https://getbootstrap.com) for styling and components
  * [Font Awesome](https://fontawesome.com) for icons


## Development
Set up the development environment with:

  * Install dependencies with the `Mix - deps.get` Task
  * Create the database with the `Mix - ecto.create` Task
  * Migrate the database with the `Mix - ecto.migrate` Task
  * Install web assets (Node.js dependencies etc.) with the `Install Assets` Task
  * Start Phoenix endpoint with `Phoenix Web Server` Task
  * Now you can visit [`localhost:4000`](http://localhost:4000) from your browser

As an example, the [Phoenix HTML Resource Generator](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Html.html) was run with:

    mix phx.gen.html Thingamabobbers Thing things name:string description:text data:map number:integer amount:decimal flag:boolean event:naive_datetime

## Running Tests
Tests can be run with the `Tests` Task or you can use the `Guard` Task to run tests automatically.


## MIT License
Copyright (c) 2019 Don Barlow

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.