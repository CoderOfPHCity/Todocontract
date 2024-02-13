import {
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Todo", function () {

  async function deployTodo() {

    const Todo = await ethers.getContractFactory("Todo");
    const todo= await Todo.deploy();

    return { todo };
  }

  describe("Deployment", function () {
    it("Should be deployed", async function () {
      const { todo } = await loadFixture(deployTodo);
      expect(todo).to.exist;
    });

    it("check todo booloean value ", async ()=>{
      // const getTodo = await todo.getAllTodo();
      const {todo } = await loadFixture(deployTodo);
      const Initialtransaction = await todo.isDone(0);

      await todo.isDone(0);

      const FinalTransaction = await todo.isDone(0);
      

      expect(Initialtransaction).to.equal(FinalTransaction);


    })
  });

});
