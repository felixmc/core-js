{module, test} = QUnit
module \ES6

test 'Array#copyWithin' (assert)->
  assert.isFunction Array::copyWithin
  assert.arity Array::copyWithin, 2
  assert.name Array::copyWithin, \copyWithin
  assert.looksNative Array::copyWithin
  assert.strictEqual (a = [1]copyWithin(0)), a
  assert.deepEqual [1 2 3 4 5]copyWithin(0 3), [4 5 3 4 5]
  assert.deepEqual [1 2 3 4 5]copyWithin(1 3), [1 4 5 4 5]
  assert.deepEqual [1 2 3 4 5]copyWithin(1 2), [1 3 4 5 5]
  assert.deepEqual [1 2 3 4 5]copyWithin(2 2), [1 2 3 4 5]
  assert.deepEqual [1 2 3 4 5]copyWithin(0 3 4), [4 2 3 4 5]
  assert.deepEqual [1 2 3 4 5]copyWithin(1 3 4), [1 4 3 4 5]
  assert.deepEqual [1 2 3 4 5]copyWithin(1 2 4), [1 3 4 4 5]
  assert.deepEqual [1 2 3 4 5]copyWithin(0 -2), [4 5 3 4 5]
  assert.deepEqual [1 2 3 4 5]copyWithin(0 -2 -1), [4 2 3 4 5]
  assert.deepEqual [1 2 3 4 5]copyWithin(-4 -3 -2), [1 3 3 4 5]
  assert.deepEqual [1 2 3 4 5]copyWithin(-4 -3 -1), [1 3 4 4 5]
  assert.deepEqual [1 2 3 4 5]copyWithin(-4 -3), [1 3 4 5 5]
  if STRICT
    assert.throws (-> Array::copyWithin.call null, 0), TypeError
    assert.throws (-> Array::copyWithin.call void, 0), TypeError
  if NATIVE
    assert.deepEqual Array::copyWithin.call({0:1, 1: 2, 2: 3, length: -1}, 1, 2), {0: 1, 1: 2, 2: 3, length: -1}, 'uses ToLength'
  assert.ok \copyWithin of Array::[Symbol.unscopables], 'In Array#@@unscopables'