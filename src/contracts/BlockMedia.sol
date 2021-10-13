// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract BlockMedia {
  struct Post{
    uint id;
    address creator;
    string content;
  }
  event PostCreated(
    uint id,
    address creator,
    string content

  );

  uint public postCount = 0;

  mapping (uint => Post) public posts;

  function createPost(string memory _content) public
  {
    postCount++;
    Post memory _post = posts[postCount];
    _post = Post(postCount, msg.sender, _content);
    posts[postCount] = _post;
    emit PostCreated(postCount, msg.sender, _content);
  }

  constructor() public {
    createPost("You can create posts here");
  }
}
