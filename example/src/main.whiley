import std::ascii
import string from js::core
import w3c::dom

import button,click,div,h1 from web::html
import MouseEvent from web::html
// Aliases

type Node is web::html::Node<State>
type Action is web::io::Action<State>

// Model

type State is { int counter }

function inc(MouseEvent e, State s0) -> (State s1, Action[] as):
    s0.counter = s0.counter + 1
    return s0,[]

function dec(MouseEvent e, State s0) -> (State s1, Action[] as):
    s0.counter = s0.counter - 1
    return s0,[]

// View

function view(State st) -> Node:
    string label = (string) ascii::to_string(st.counter)
    Node b1 = button([click(&inc)],"+")
    Node b2 = button([click(&dec)],"-")
    return div([h1("Hello World!"),div(label),b1,b2])

// Controller

public export method main(dom::Window w, dom::Element e):
    // Set initial state
    State s = { counter: 0 }
    // Create web app
    web::io::App<State> app = { model: s, view: &view }
    // Start the web app!
    web::app::run(app,e,w)