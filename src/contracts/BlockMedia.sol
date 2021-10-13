// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract BlockMedia {

  struct Post{
    uint id;
    address creator;
    string content;
    uint num_comment;
  }

  struct Comment{
    uint id;
    address creator;
    string comment;
  }

  event PostCreated(
    uint id,
    address creator,
    string content,
    uint num_comment

  );

  event CommentPosted(
    uint id,
    address creator,
    string comment
  );

  uint public postCount = 0;

  mapping (uint => Post) public posts;
  mapping (uint => Comment[]) public comments;

  function createPost(string memory _content) public
  {
    postCount++;
    Post memory _post = posts[postCount];
    _post = Post(postCount, msg.sender, _content, 0);
    posts[postCount] = _post;
    emit PostCreated(postCount, msg.sender, _content, 0);
  }

  function postComment(uint _id, string memory _comment) public
  {
    Post memory _post = posts[_id];
    _post.num_comment = _post.num_comment + 1;
    comments[_id][_post.num_comment] = Comment(_post.num_comment, msg.sender, _comment);
    posts[_id] = _post;
    emit CommentPosted(_id, msg.sender, _comment);

  }

  constructor() public {
    createPost("You can create posts here");
  }
}
