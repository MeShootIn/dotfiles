const template = document.createElement('template');
template.innerHTML = `
<slot name="date-word">Default value for named slot</slot>
<slot>Default value for UNnamed slot</slot>
`;

export default class <++> extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {}

  disconnectedCallback() {}

  static get observedAttributes() {
    return [];
  }

  attributeChangedCallback(name, oldValue, newValue) {}

  adoptedCallback() {}
}

customElements.define("<++>", <++>);
