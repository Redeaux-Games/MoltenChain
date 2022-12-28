import {
  Client,
  GetTransactionQuery,
  GetTransactionQueryResponse,
  GetTransactionQueryVariables,
  GetAccountQuery,
  GetAccountQueryResponse,
  GetAccountQueryVariables,
  GetBlockQuery,
  GetBlockQueryResponse,
  GetBlockQueryVariables,
  GetNFTTokenQuery,
  GetNFTTokenQueryResponse,
  GetNFTTokenQueryVariables,
  NFTMintMutation,
  NFTMintMutationResponse,
  NFTMintMutationVariables,
  NFTBurnMutation,
  NFTBurnMutationResponse,
  NFTBurnMutationVariables,
  TokenMintMutation,
  TokenMintMutationResponse,
  TokenMintMutationVariables,
  TokenBurnMutation,
  TokenBurnMutationResponse,
  TokenBurnMutationVariables,
} from '@moltenchain/moltenchain-sdk';

export class MoltenChainClient {
  private client: Client;

  constructor(endpoint: string) {
    this.client = new Client(endpoint);
  }

  public async getTransaction(txHash: string): Promise<GetTransactionQueryResponse> {
    const variables: GetTransactionQueryVariables = {
      hash: txHash,
    };
    const query: GetTransactionQuery = {
      query: GetTransactionQuery,
      variables,
    };
    return this.client.query<GetTransactionQuery, GetTransactionQueryResponse>(query);
  }

  public async getAccount(address: string): Promise<GetAccountQueryResponse> {
    const variables: GetAccountQueryVariables = {
      address,
    };
    const query: GetAccountQuery = {
      query: GetAccountQuery,
      variables,
    };
    return this.client.query<GetAccountQuery, GetAccountQueryResponse>(query);
  }

  public async getBlock(height: number): Promise<GetBlockQueryResponse> {
    const variables: GetBlockQueryVariables = {
      height,
    };
    const query: GetBlockQuery = {
      query: GetBlockQuery,
      variables,
    };
    return this.client.query<GetBlockQuery, GetBlockQueryResponse>(query);
  }

  public async getNFTToken(tokenId: string): Promise<GetNFTTokenQueryResponse> {
    const variables: GetNFTTokenQueryVariables = {
      tokenId,
    };
    const query: GetNFTTokenQuery = {
      query: GetNFTTokenQuery,
      variables,
    };
    return this.client.query<GetNFTTokenQuery, GetNFTTokenQueryResponse>(query);
  }

  public async mintNFT(
    to: string,
    tokenId: string,
    metadata: any,
  ): Promise<NFTMintMutationResponse> {
