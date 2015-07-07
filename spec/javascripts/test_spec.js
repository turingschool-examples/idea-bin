describe('the test spec', function () {
  it('should work', function (done) {
    MagicLamp.load('ideas/index');
    $.getJSON('/ideas').then(function (ideas) {
      assert.equal($('.ideas').length, 1);
      done();
    });
  });
});
