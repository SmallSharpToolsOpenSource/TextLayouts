TextLayouts
===========

Sample project for laying out text in iOS 7 using constraints in a scroll view, table view and collection view.

Working with iOS 7 layouts with autolayout and the new style for transparent top and bottom bars can be tricky. This projects shows 3 ways to display a set of text labels using features available in iOS 7.

Whenever possible automatic features are used. For example, the content insets for the table and collection views are set automatically. There is a sample label hidden in those scenes to use for reference and must be kept higher in the view stack than the table and collection views to ensure the content insets are set automatically.

If the content insets are not set automatically it is possible to use the top and bottom layout guides in code to manually set the content insets.

For the scroll view the content size is calculated using constraints and the height of each label is left to the intrinsic size of the label due to the text content. This way it does not have to be calculated.

#### Brennan Stehling - SmallSharpTools LLC - 2013
#### [@smallsharptools](https://alpha.app.net/smallsharptools)
#### [@smallsharpTools](http://twitter.com/smallsharptools)

