import React from 'react';
import chai from 'chai';
import { shallow } from 'enzyme';

import SearchFilter from 'src/components/SearchFilter';

const expect = chai.expect;

describe('src/components/SearchFilter', () => {

  function getComponent(defaultProps, overrides = {}) {
    return shallow(<SearchFilter {...{...defaultProps, ...overrides}}/>);
  }

  it('Display SearchFilter', () => {
    const defaultProps = {
      search: 'search me',
      language: 'cpp'
    };
    const onSelected = chai.spy();

    const component = getComponent(defaultProps, {
      setLanguage: chai.spy(),
      setSearch: chai.spy()
    });

    const select = component.find('.select.input');

    select.simulate('change', {
      value: 'ruby'
    });

    expect(select.html()).match(/class="Select-input"/)
    expect(onSelected).to.have.been.called.with('ruby');
  });


});