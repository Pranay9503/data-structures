#include<stdio.h>
#include<stdlib.h>
struct Node{
	int data;
	int height;
	struct Node* left;
	struct Node* right;
};
//Insertion and deletion in AVL Tree
struct Node* NewNode(int data){
	struct Node* temp = (struct Node*)malloc(sizeof(struct Node));
	temp->data = data;
	temp->left = temp->right = NULL;
	temp->height = 1;
	return temp;
}
int max(int a,int b){
 	return (a>b)?a:b;
}
int height(struct Node* node){
	if(node==NULL)  return 0;
 	return node->height;
}
int Balance(struct Node* node){
	if(node==NULL)	return 0;
    return height(node->left) - height(node->right);
}
struct Node* LeftRotate(struct Node* z){
	struct Node* y = z->right;
	struct Node* t2 = y->left;

	y->left = z;
	z->right = t2;

	z->height = max(height(z->left),height(z->right))+1;
	y->height = max(height(y->left),height(y->right))+1;

	return y;
}
struct Node* RightRotate(struct Node* z){
	struct Node* y = z->left;
	struct Node* t3 = y->right;

	y->right = z;
	z->left = t3;

	z->height = max(height(z->left),height(z->right))+1;
	y->height = max(height(y->left),height(y->right))+1;

	return y;
}
struct Node* search(struct Node *p,int x){
    if(p==NULL) return p;
    else if(p->data > x) return(search(p->left,x));
    else if(p->data < x)return(search(p->right,x));
    else return p;
}
void inorder(struct Node* root){
	if(root==NULL)	return;
    inorder(root->left);
	printf("%d ",root->data);
	inorder(root->right);
}
void preorder(struct Node* root){
	if(root==NULL)	return;
	printf("%d ",root->data);
	preorder(root->left);
	preorder(root->right);
}
void postorder(struct Node* root){
	if(root==NULL)	return;
    postorder(root->left);
	postorder(root->right);
	printf("%d ",root->data);
}
struct Node* FindMin(struct Node* node){
	while(node->left!=NULL)    node = node->left;
	return node;
}
struct Node* FindMax(struct Node* node){
	while(node->right!=NULL)	node = node->right;
    return node;
}
struct Node* Delete(struct Node* root,int data){
	if(root==NULL)	return root;
	if(data < root->data)	root->left = Delete(root->left,data);
	else if(data > root->data)	root->right = Delete(root->right,data);
	else{
		if(root->right==NULL && root->left==NULL){
			free(root);
			root = NULL;
		}
		else if(root->left!=NULL && root->right==NULL){
			struct Node* temp = root->left;
			root = root->left;
			free(temp);
		}
		else if(root->right!=NULL && root->left==NULL){
			struct Node* temp = root->right;
			root = root->right;
			free(temp);
		}
		else{
			struct Node* temp = FindMin(root->right);
			root->data = temp->data;
			root->right = Delete(root->right,temp->data);
		}
	}
	if(root==NULL)	return root;

	root->height = 1 + max(height(root->left),height(root->right));

	int balance = Balance(root);

	//Left Left Case
	if(balance > 1 && Balance(root->left) >=0)
		return RightRotate(root);

	// Right Right Case
	if(balance < -1 && Balance(root->right) <=0)
		return LeftRotate(root);

	// Left Right Case
	if(balance > 1 && Balance(root->left) < 0)
	{
		root->left = LeftRotate(root->left);
		return RightRotate(root);
	}
	
	//Right Left Case
	if(balance < -1 && Balance(root->right) > 0)
	{
		root->right = RightRotate(root->right);
		return LeftRotate(root);
	}
	return root;
}

struct Node* Insert(struct Node* root,int data)
{
	if(root==NULL)
		return NewNode(data);

	if(data < root->data)
		root->left = Insert(root->left,data);

	else if(data > root->data)
		root->right = Insert(root->right,data);

	else
		return root;

	root->height = max(height(root->left),height(root->right))+1;

	int balance = Balance(root);

	// Left Left Case
	if(balance > 1 && data < root->left->data)
		return RightRotate(root);

	// Right Right Case
	if(balance < -1 && data > root->right->data)
		return LeftRotate(root);

	//Left Right Case
	if(balance > 1 && data > root->left->data)
	{
		root->left = LeftRotate(root->left);
		return RightRotate(root);
	}

	// Right Left Case
	if(balance < -1 && data < root->right->data)
	{
		root->right = RightRotate(root->right);
		return LeftRotate(root);
	}

	return root;
}
int main(){
    struct Node *root=NULL,*temp;
    int x,ch;
    while(1)
    {   
        printf("\n1:Insert 2:Inorder  3:Preorder  4:Postorder  5:Find Min  6:Find Max  7:Search  8:Delete  9:EXIT");
        printf("\nenter your choice\n");
        scanf("%d",&ch);
        switch(ch)
        {
            case 1: 
                    printf("Enter the element to be Inserted:");
                    scanf("%d",&x);
                    root=Insert(root,x);
                    break;
            case 2: inorder(root);
                    break;
            case 3: preorder(root);
                    break;
            case 4: postorder(root);
                    break;
            case 5: printf("Min of BST is:%d",(FindMin(root))->data);
                    break;
            case 6: printf("Max of BST is:%d",(FindMax(root))->data);
                    break;
            case 7: printf("Enter the element to be Searched:");
                    scanf("%d",&x);
                    temp=search(root,x);
                    if(temp==NULL) printf("Element is _not_ Found:");
                    else           printf("Element is _._Found:");
                    break;
            case 8: printf("Enter the element to be Deleted:");
                    scanf("%d",&x);
                    root=Delete(root,x);
                    break;
            case 9: exit(0);
            default:printf("invalid input");
                    break;
           
        }
    }
}
