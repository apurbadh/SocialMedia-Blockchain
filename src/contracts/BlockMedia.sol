// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract BlockMedia {

  struct Post{
    uint id;
    address payable creator;
    string content;
    uint tipAmount;
  }


  event PostCreated(
    uint id,
    address payable creator,
    string content,
    uint num_comment

  );

  event PostTipped(
    uint id,
    address payable creator,
    string content,
    uint tipAmount
  );

  uint public postCount = 0;

  mapping (uint => Post) public posts;

  function createPost(string memory _content) public
  {
    postCount++;
    Post memory _post = posts[postCount];
    _post = Post(postCount, msg.sender, _content, 0);
    posts[postCount] = _post;
    emit PostCreated(postCount, msg.sender, _content, 0);
  }

  function tipPost(uint _id) public payable
  {
    Post memory _post = posts[_id];
    address payable _creator = _post.creator;
    _creator.transfer(msg.value);
    posts[_id] = _post;
    emit PostTipped(_id, _creator, _post.content, _post.tipAmount);


  }

  constructor() public {
    createPost("You can create posts here");
  }
}
